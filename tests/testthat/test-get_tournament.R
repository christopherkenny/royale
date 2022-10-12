with_mock_dir("t/tournament", {
  test_that("cr_get_tournament works", {
    tournament <- cr_get_tournament_search('a')$tag[1]
    x <- cr_get_tournament(tournament)
    expect_s3_class(x, 'tbl_df')
  })
})
