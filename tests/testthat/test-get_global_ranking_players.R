with_mock_dir("t/grp", {
  test_that("cr_get_global_ranking_players works", {
    x <- cr_get_global_ranking_players('2022-09', limit = 10)
    expect_s3_class(x, 'tbl_df')
  })
})
