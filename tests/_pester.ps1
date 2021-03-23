$PesterResult = Invoke-Pester -Output Detailed -PassThru
if ($PesterResult.Result -ne 'Passed') {
    throw "There were $($PesterResult.FailedCount) failed tests."
}
