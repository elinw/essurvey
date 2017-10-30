# Test for only one wave
wave_one <- ess_country("Denmark", 1, "cimentadaj@gmail.com")

# check is list
expect_is(wave_one, "list")

# check is length one
expect_length(wave_one, 1)

# check that ess_country returns data frames
expect_is(wave_one[[1]], "data.frame")

# check that the number of rows is greater than 0
expect_gt(nrow(wave_one[[1]]), 0)

# check that the number of columns is greater than 0
expect_gt(ncol(wave_one[[1]]), 0)


# Test for all rounds
all_rounds <- ess_country("Netherlands", 1:7, "cimentadaj@gmail.com")

# check is list
expect_is(all_rounds, "list")

# check is length one
expect_length(all_rounds, 7)

# check that all ess returns data frames
expect_equal(all(sapply(all_rounds, function(x) "data.frame" %in% class(x))), TRUE)

# check that all data frames have more than 0 rows
expect_equal(all(sapply(all_rounds, nrow) > 0), TRUE)

# check that all data frames have more than 0 columns
expect_equal(all(sapply(all_rounds, ncol) > 0), TRUE)

# Test for only downloads

# Test whether you get a message where the downloads are at
which_rounds <- 2

expect_message(downloads <-
                 ess_country("Austria",
                             1:which_rounds,
                             "cimentadaj@gmail.com",
                             only_download = TRUE
                             ),
               "All files saved to")

# Test whether the downloaded files are indeed there
ess_files <- list.files(downloads, pattern = "ESS", recursive = TRUE)

# Same number of stata files as the rounds attempted
# to download?
expect_equal(sum(grepl(".dta", ess_files)), which_rounds)

# Same number of zip files as the rounds attempted
# to download?
expect_equal(sum(grepl(".zip", ess_files)), which_rounds)

# Same number of do files as the rounds attempted
# to download?
expect_equal(sum(grepl(".do", ess_files)), which_rounds)

# Delete all downloaded files
unlink(dirname(downloads), recursive = TRUE, force = TRUE)