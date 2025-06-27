# main_script10.R


# Make sure working directory is the same as the script location (implicitly handled in GitHub Actions)
# Print working directory
cat("Working directory:", getwd(), "\n")

# Set up and confirm output folder
output_dir <- file.path(getwd(), "outputs/script10")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
cat("Created directory:", output_dir, "\n")

# Confirm contents before saving
print("Files in 'outputs' before saving:")
print(list.files("outputs", recursive = TRUE))

# Save dummy test file just to verify
writeLines("test", file.path(output_dir, "test.txt"))




# Load the helper script
source("RD_and_DT_Algorithm_copy.R")  # Ensure this file is in the same directory

lambda <- 2



results_6 <- data.frame(
  Run = integer(),
  C = numeric(),
  Length = numeric(),
  Cost = numeric(),
  NumDisambigs = integer(),
  N = integer()
)

cost <- 6

for (i in 1:200) {
  set.seed(1000+i)
  obs_gen_para <- c(gamma = 0.3, d = 5, noPoints = 150, no_c = 75, no_o = 75)
  result <- ACS_Alg_M(obs_gen_para, kei = 5, lambda, cost)
  
  results_6[i, ] <- list(
    Run = i,
    C = cost,
    Length = result$Length_total,
    Cost = result$Cost_total,
    NumDisambigs = length(result$Disambiguate_state),
    N = 25
  )
}

saveRDS(results_6, file.path(output_dir, "data_25_1_6.rds"))





results_7 <- data.frame(
  Run = integer(),
  C = numeric(),
  Length = numeric(),
  Cost = numeric(),
  NumDisambigs = integer(),
  N = integer()
)

cost <- 7

for (i in 1:200) {
  set.seed(1200+i)
  obs_gen_para <- c(gamma = 0.3, d = 5, noPoints = 150, no_c = 75, no_o = 75)
  result <- ACS_Alg_M(obs_gen_para, kei = 5, lambda, cost)
  
  results_7[i, ] <- list(
    Run = i,
    C = cost,
    Length = result$Length_total,
    Cost = result$Cost_total,
    NumDisambigs = length(result$Disambiguate_state),
    N = 25
  )
}

saveRDS(results_7, file.path(output_dir, "data_25_1_7.rds"))



results_8 <- data.frame(
  Run = integer(),
  C = numeric(),
  Length = numeric(),
  Cost = numeric(),
  NumDisambigs = integer(),
  N = integer()
)

cost <- 8 

for (i in 1:200) {
  set.seed(1400+i)
  obs_gen_para <- c(gamma = 0.3, d = 5, noPoints = 150, no_c = 75, no_o = 75)
  result <- ACS_Alg_M(obs_gen_para, kei = 5, lambda, cost)
  
  results_8[i, ] <- list(
    Run = i,
    C = cost,
    Length = result$Length_total,
    Cost = result$Cost_total,
    NumDisambigs = length(result$Disambiguate_state),
    N = 25
  )
}

saveRDS(results_8, file.path(output_dir, "data_25_1_8.rds"))




results_9 <- data.frame(
  Run = integer(),
  C = numeric(),
  Length = numeric(),
  Cost = numeric(),
  NumDisambigs = integer(),
  N = integer()
)

cost <- 9

for (i in 1:200) {
  set.seed(1600+i)
  obs_gen_para <- c(gamma = 0.3, d = 5, noPoints = 150, no_c = 75, no_o = 75)
  result <- ACS_Alg_M(obs_gen_para, kei = 5, lambda, cost)
  
  results_9[i, ] <- list(
    Run = i,
    C = cost,
    Length = result$Length_total,
    Cost = result$Cost_total,
    NumDisambigs = length(result$Disambiguate_state),
    N = 25
  )
}

saveRDS(results_9, file.path(output_dir, "data_25_1_9.rds"))




# Combine all results into one table
results <- rbind(results_6, results_7, results_8, results_9)

# Format output
results_out <- data.frame(
  Index = paste0('"', 1:nrow(results), '"'),  # Quoted index
  results[, c("C", "Length", "Cost", "NumDisambigs", "N")]  # Make sure column names match
)

# Define the custom header (space-separated, quoted)
header <- '"C" "length" "cost" "number_of_disambiguations" "n"'

# Define output path
txt_path <- file.path(output_dir, "results_ACS5_mixed.txt")

# Write header manually
writeLines(header, txt_path)

# Append data
write.table(
  results_out,
  file = txt_path,
  append = TRUE,
  row.names = FALSE,
  col.names = FALSE,
  quote = FALSE,
  sep = " "
)

cat("✅ Text results saved to:", txt_path, "\n")
