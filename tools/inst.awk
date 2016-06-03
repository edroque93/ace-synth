#!/usr/bin/awk -f

BEGIN {
	cnt=0
	header=""
	body=""
}

/module / {
	module=$2;
	flag=1;
	next;
}
/);/ {
	if (length(body) > 0) {
		body=substr(body,1,length(body)-2);
		print "// Wires for " module;
		print header "\n";

		print "// Module " module;
		print module " " module " ("
		print body
		print ");\n"
	}

	flag=0;
	module="";
	header="";
	body="";
}
flag && !/\// {
	gsub(/input |output |wire |reg |,/, "");

	if (/\[/) {
		header=header "wire " $1 " @" module "_" cnt "@;\n";
		body=body "\t." $2 " (@" module "_" cnt "@),\n";
	} else {
		header=header "wire @" module "_" cnt "@;\n";
		body=body "\t." $1 "(@" module "_" cnt "@),\n";
	}
	cnt++;
}

