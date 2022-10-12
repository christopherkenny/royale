with_mock_dir("t/location", {
  test_that("cr_get_location works", {
    x <- cr_get_location(57000001)
    expect_s3_class(x, 'tbl_df')
  })
})
