test_that("Path can be derived for windows Python >= 3.0", {
  paths_base <- with_mock(
    "precommit::path_derive_precommit_exec_win_python3plus_candidates" = function() {
      c(
        fs::path_home("AppData/Roaming/Python/Python35"),
        fs::path_home("AppData/Roaming/Python/Python37")
      )
    },
    path_derive_precommit_exec_win_python3plus_base()
  )

  expect_equal(
    paths_base,
    c(
      fs::path(fs::path_home(), "AppData/Roaming/Python/Python37/Scripts"),
      fs::path(fs::path_home(), "AppData/Roaming/Python/Python35/Scripts")
    )
  )
  skip_if(!is_windows())
  skip_if(!not_conda())
  expect_match(path_derive_precommit_exec_win_python3plus_base(), 'AppData/Roaming')
  expect_equal(
    fs::path_file(path_derive_precommit_exec_win()), 
    precommit_executable_file()
  )
})
