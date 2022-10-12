with_mock_dir("t/global_tournaments", {
  test_that("cr_get_global_tournaments works", {
    x <- cr_get_global_tournaments()
    expect_s3_class(x, 'tbl_df')
  })
})
