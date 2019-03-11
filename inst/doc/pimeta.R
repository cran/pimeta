## ---- echo = TRUE, fig.width = 5, fig.height = 3-------------------------
require("pimeta")
data(sbp, package = "pimeta")

# a parametric bootstrap prediction interval
out <- pima(
  y        = sbp$y,      # effect size estimates
  se       = sbp$sigmak, # within studies standard errors
  B        = 25000,      # number of bootstrap samples
  seed     = 14142135,   # random number seed
  parallel = 4           # multi-threading     
)
out
plot(out, base_size = 10, studylabel = sbp$label)

## ---- echo = TRUE--------------------------------------------------------
# Higgins-Thompson-Spiegelhalter prediction interval
pima(sbp$y, sbp$sigmak, method = "HTS")

# Partlett-Riley prediction interval (Hartung and Knapp's variance)
pima(sbp$y, sbp$sigmak, method = "HK")

# Partlett-Riley prediction interval (Sidik and Jonkman's variance)
pima(sbp$y, sbp$sigmak, method = "SJ")

# Partlett-Riley prediction interval (Kenward and Roger's variance)
pima(sbp$y, sbp$sigmak, method = "KR")

## ---- echo = TRUE, fig.width = 5, fig.height = 3-------------------------
m1 <- c(15,12,29,42,14,44,14,29,10,17,38,19,21)
n1 <- c(16,16,34,56,22,54,17,58,14,26,44,29,38)
m2 <- c( 9, 1,18,31, 6,17, 7,23, 3, 6,12,22,19)
n2 <- c(16,16,34,56,22,55,15,58,15,27,45,30,38)
dat <- convert_bin(m1, n1, m2, n2, type = "logOR")
dat
pibin <- pima(dat$y, dat$se, seed = 2236067, parallel = 4)
pibin
binlabel <- c(
   "Creytens", "Milo", "Francois and De Nutte", "Deruyttere et al.",
   "Hannon", "Roesch", "De Nutte et al.", "Hausken and Bestad",
   "Chung", "Van Outryve et al.", "Al-Quorain et al.", "Kellow et al.",
   "Yeoh et al.")
plot(pibin, digits = 2, base_size = 10, studylabel = binlabel)

