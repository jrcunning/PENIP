// Full adult and juvenile joint model; exact original PEV fixed priors.
functions {
  real joint_zinb(array[] int ys, int start, int end,
                  array[] int cell, array[] int dataset, array[] int direction,
                  vector log_area, matrix log_mu, matrix dir_effect,
                  vector zi_eta, vector phi) {
    real lp = 0;
    for (s in 1:size(ys)) {
      int i = start + s - 1;
      int k = cell[i];
      real eta = log_area[i] + log_mu[dataset[i], k]
                 + dir_effect[k, direction[i]];
      if (ys[s] == 0)
        lp += log_sum_exp(log_inv_logit(zi_eta[k]),
               log1m_inv_logit(zi_eta[k]) + neg_binomial_2_log_lpmf(0 | eta, phi[k]));
      else
        lp += log1m_inv_logit(zi_eta[k]) + neg_binomial_2_log_lpmf(ys[s] | eta, phi[k]);
    }
    return lp;
  }
}
data {
  int<lower=1> N;
  int<lower=1> K;
  int<lower=1> R;
  int<lower=1> T;
  int<lower=1> H;
  int<lower=1> D;
  int<lower=1,upper=D> target_dataset;
  array[N] int<lower=0> y;
  array[N] int<lower=1,upper=2*K> cell;
  array[N] int<lower=1,upper=D> dataset;
  array[N] int<lower=1,upper=2> direction;
  array[K] int<lower=1,upper=T> taxon_cell;
  array[K] int<lower=1,upper=H> habitat_cell;
  vector[N] log_area;
  cholesky_factor_cov[K] L_mu_prior;
  matrix[K,R] L_fixed_prior;
  vector[K] fixed_prior_sums;
  real<lower=0> region_mu_sd;
  real<lower=0> region_dpar_sd_scale;
  int<lower=1> grainsize;
}
parameters {
  vector[K] z_alpha;
  vector[K] delta_mu;
  real zi_intercept;
  vector[R] z_zi;
  real shape_intercept;
  vector[R] z_shape;
  vector[K] z_zi_region;
  vector[K] z_shape_region;
  real<lower=0> sd_zi_region;
  real<lower=0> sd_shape_region;
  matrix[H,D] dataset_raw;
  vector<lower=0>[H] sd_dataset;
  cholesky_factor_corr[H] L_dataset;
  matrix[T,D] dataset_taxon_raw;
  real<lower=0> sd_dataset_taxon;
  matrix[2*K,2] direction_raw;
  vector<lower=0>[2] sd_direction;
}
transformed parameters {
  vector[K] alpha = rep_vector(-2.8,K) + L_mu_prior * z_alpha;
  vector[2*K] zi_eta;
  vector[2*K] log_phi;
  vector[2*K] phi;
  matrix[D,H] dataset_effect = (diag_pre_multiply(sd_dataset,L_dataset) * dataset_raw)';
  matrix[D,T] dataset_taxon_effect = (sd_dataset_taxon * dataset_taxon_raw)';
  matrix[D,2*K] log_mu;
  matrix[2*K,2] dir_effect;
  zi_eta[1:K] = rep_vector(zi_intercept,K) + 1.5*fixed_prior_sums + 2.5*L_fixed_prior*z_zi;
  log_phi[1:K] = rep_vector(shape_intercept,K) - 0.9*fixed_prior_sums + L_fixed_prior*z_shape;
  zi_eta[(K+1):(2*K)] = zi_eta[1:K] + sd_zi_region*z_zi_region;
  log_phi[(K+1):(2*K)] = log_phi[1:K] + sd_shape_region*z_shape_region;
  phi = exp(log_phi);
  for (r in 1:2) for (k in 1:K) {
    int j = (r-1)*K+k;
    dir_effect[j] = sd_direction[r]*direction_raw[j];
    for (d in 1:D)
      log_mu[d,j] = alpha[k] + (r == 2 ? delta_mu[k] : 0)
        + dataset_effect[d,1]
        + (habitat_cell[k] == 1 ? 0 : dataset_effect[d,habitat_cell[k]])
        + dataset_taxon_effect[d,taxon_cell[k]];
  }
}
model {
  z_alpha ~ std_normal();
  delta_mu ~ normal(0,region_mu_sd);
  zi_intercept ~ logistic(0,1);
  z_zi ~ std_normal();
  shape_intercept ~ student_t(3,0,2.5);
  z_shape ~ std_normal();
  z_zi_region ~ std_normal();
  z_shape_region ~ std_normal();
  sd_zi_region ~ normal(0,region_dpar_sd_scale);
  sd_shape_region ~ normal(0,region_dpar_sd_scale);
  to_vector(dataset_raw) ~ std_normal();
  sd_dataset ~ exponential(4);
  L_dataset ~ lkj_corr_cholesky(1);
  to_vector(dataset_taxon_raw) ~ std_normal();
  sd_dataset_taxon ~ exponential(4);
  to_vector(direction_raw) ~ std_normal();
  sd_direction ~ exponential(4);
  target += reduce_sum_static(joint_zinb,y,grainsize,cell,dataset,direction,
                              log_area,log_mu,dir_effect,zi_eta,phi);
}
generated quantities {
  vector[2*K] density_2024;
  vector[2*K] density_north;
  vector[2*K] density_south;
  real log_lik_sum = joint_zinb(y,1,N,cell,dataset,direction,log_area,
                              log_mu,dir_effect,zi_eta,phi);
  for (j in 1:(2*K)) {
    density_2024[j] = exp(log_mu[target_dataset,j] + log1m_inv_logit(zi_eta[j]));
    density_north[j] = density_2024[j]*exp(dir_effect[j,1]);
    density_south[j] = density_2024[j]*exp(dir_effect[j,2]);
  }
}
