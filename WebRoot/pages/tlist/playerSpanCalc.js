/**
 * 
 */
addEventListener('message', function(event) {
	var lstA = event.data[0];
	var lstB = event.data[1];
	calcSpan(lstA, lstB);
});

function calcSpan(lista, listb) {
	var count_span = 0;
	for (var i in listb) {
		var flag = true;
		for (var x in lista) {
			if (listb[i].idcard == lista[x].idcard) {
				flag = false;
				break;
			}
		}
		if (flag) {
			count_span++;
		}
	}
	postMessage(count_span);
}