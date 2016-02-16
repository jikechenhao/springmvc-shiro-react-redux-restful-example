export function getColClass(colCount1, colCount2, others = null) {
    return 'col-lg-' + colCount1 + ' col-md-' + colCount1 + ' col-sm-' + colCount2 + ' col-xs-' + colCount2 + ' ' + others;
}

export function getOffsetClass(colOffsetCount1, colOffsetCount2, others = null) {
    return 'col-lg-offset-' + colOffsetCount1 + ' col-md-offset-' + colOffsetCount1 + ' col-sm-offset-' + colOffsetCount2 + ' col-xs-offset-' + colOffsetCount2 + ' ' + others;
}