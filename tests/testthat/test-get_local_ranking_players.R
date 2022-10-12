with_mock_dir("t/local_ranking_players", {
  test_that("cr_get_local_ranking_players works", {
    x <- cr_get_local_ranking_players(57000249, limit = 10)
    expect_s3_class(x, 'tbl_df')
  })
})
