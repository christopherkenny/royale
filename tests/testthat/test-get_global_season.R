with_mock_dir("t/global_season", {
  test_that("cr_get_global_season works", {
    x <- cr_get_global_season('2022-09')
    expect_equal(x, '2022-09')
  })
})
