with_mock_dir("t/local_ranking_clans", {
  test_that("cr_get_local_ranking_clans works", {
    x <- cr_get_local_ranking_clans(57000249, limit = 10)
    expect_s3_class(x, 'tbl_df')
  })
})
