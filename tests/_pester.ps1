$PesterResult = Invoke-Pester -PassThru
if ($PesterResult.Result -ne 'Passed') {
    throw "There were $($PesterResult.FailedCount) failed tests."
}
