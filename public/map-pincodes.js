function init() {
    var svg = d3.select(document.getElementsByTagName("iframe")[0].contentWindow.document);
    svg.selectAll('g').style('fill', 'grey');
}

function exists(coll, obj) {
    for (i in coll) {
        if (coll[i].toLowerCase() == obj.toLowerCase()) return obj;
    }
}

function processInput() {
    var data = $('#pincode').serialize();
    $.ajax({
        url: "/pincode",
        data: data,
        type: 'get',
        context: document.body
    }).done(function (response) {
            var states = response.states;
            var districts = response.districts;
            var svg = d3.select(document.getElementsByTagName("iframe")[0].contentWindow.document);
            svg.selectAll('g').style('fill', 'grey');
            svg.selectAll('path').style('fill', 'grey');

            if (states) {
                console.log(states);
                svg.selectAll('g').each(function () {
                    var self = d3.select(this);
                    var title = self.attr('title');
                    if (title && exists(states, title)) {
                        self.style('fill', 'green');
                        self.selectAll('path').style('fill', 'green');
                    }
                });
            } else if (districts) {
                console.log(districts);
                svg.selectAll('path').each(function () {
                    var self = d3.select(this);
                    var title = self.attr('title');
                    if (title && exists(districts, title)) {
                        self.style('fill', 'green');
                    } else {
                        self.style('fill', 'grey');
                    }
                });
            } else {
                console.log('no response');
                console.log(response);
            }
        });
}