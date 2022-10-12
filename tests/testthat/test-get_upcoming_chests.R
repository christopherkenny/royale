with_mock_dir("t/upcoming_chests", {
  test_that("cr_get_upcoming_chests works", {
    x <- cr_get_upcoming_chests('JYJQC88')
    expect_s3_class(x, 'tbl_df')
  })
})
