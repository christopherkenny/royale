with_mock_dir("t/player", {
  test_that("cr_get_player works", {
    x <- cr_get_player('JYJQC88')
    expect_s3_class(x, 'tbl_df')
  })
})
