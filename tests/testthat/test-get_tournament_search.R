with_mock_dir("t/tournament_search", {
  test_that("cr_get_tournament_search works", {
    x <- cr_get_tournament_search('clash')
    expect_s3_class(x, 'tbl_df')
  })
})
