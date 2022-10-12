with_mock_dir("t/global_seasons", {
  test_that("cr_get_global_seasons works", {
    x <- cr_get_global_seasons()
    expect_s3_class(x, 'tbl_df')
  })
})
