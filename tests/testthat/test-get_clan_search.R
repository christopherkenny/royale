with_mock_dir("t/clan_search", {
  test_that("cr_get_clan_search works", {
    x <- cr_get_clan_search('Legend Dynasty!')
    expect_s3_class(x, 'tbl_df')
  })
})
