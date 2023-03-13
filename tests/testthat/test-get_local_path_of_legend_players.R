with_mock_dir("t/local_path_of_legend_players", {
 test_that("cr_get_local_path_of_legend_players works", {
   x <- cr_get_local_path_of_legend_players(57000249, limit = 10)
   expect_s3_class(x, 'tbl_df')
 })
})
