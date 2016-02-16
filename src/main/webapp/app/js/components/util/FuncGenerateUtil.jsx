module.exports = {
    generate: function (data) {
        let funcList = [];

        data.forEach((expression, index) => {
            if ('function' == typeof expression) {
                funcList.push(expression);
            } else if (0 == expression.indexOf('string.')) {
                expression = expression.substring(7);
                funcList.push(new Function(['item', 'index', 'rowStyle'], 'return \'' + expression + '\';'));
            } else if (0 == expression.indexOf('date.')) {
                expression = expression.substring(5);
                funcList.push(new Function(['item', 'index', 'rowStyle'], 'var date = new Date(' + expression + ');return date.getFullYear()+\'-\'+(date.getMonth() + 1)+\'-\'+date.getDate();'));
            } else {
                funcList.push(new Function(['item', 'index', 'rowStyle'], 'return ' + expression + ';'));
            }
        });

        return funcList;
    }
};