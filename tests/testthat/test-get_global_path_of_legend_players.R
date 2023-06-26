with_mock_dir("t/g_pol_p", {
  test_that("cr_get_global_path_of_legend_players works", {
    x <- cr_get_global_path_of_legend_players('2023-02', limit = 10)
    expect_s3_class(x, 'tbl_df')
  })
})

