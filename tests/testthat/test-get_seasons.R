with_mock_dir("t/seasons", {
  test_that("cr_get_seasons works", {
    x <- cr_get_seasons()
    expect_s3_class(x, 'tbl_df')
  })
})
