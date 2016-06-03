#!/usr/bin/awk -f

/module / {
	module=$2;
	flag=1;
	header="";
	body="";
	cnt=0;
	next;
}
/);/ {
	if (header) {
		print "// Wires for " module;
		print header;
		header="";
	}
	if (body) {
		body=substr(body,1,length(body)-2);

		print "// Module " module;
		print module " " module " ("
		print body
		print ");\n"
		body="";
	}

}
flag && !/\// && /output /{
	gsub(/output |wire |reg |,/, "");

	if (/\[/) {
		header=header "wire " $1 " " module "_" $2 ";\n";
		body=body "\t." $2 " (" module "_" $2 "),\n";
	} else {
		header=header "wire " module "_" $1 ";\n";
		body=body "\t." $1 "(" module "_" $1 "),\n";
	}
}

flag && !/\// && /input /{
	gsub(/input |wire |reg |,/, "");

	if (/\[/) {
		body=body "\t." $2 " (@" module "_" cnt "@),\n";
	} else {
		body=body "\t." $1 "(@" module "_" cnt "@),\n";
	}
	cnt++;
}

