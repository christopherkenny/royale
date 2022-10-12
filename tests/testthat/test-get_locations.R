with_mock_dir("t/locations", {
  test_that("cr_get_locations works", {
    x <- cr_get_locations()
    expect_s3_class(x, 'tbl_df')
  })
})
