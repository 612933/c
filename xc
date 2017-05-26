A = load '/hdfs-site.xml' using org.apache.pig.piggybank.storage.XMLLoader('property') as (x:chararray);

B = foreach A generate REPLACE(x,'[\\n]','') as x;

C = foreach B generate REGEX_EXTRACT_ALL(x,'.*(?:<name>)([^<]*).*(?:<value>)([^<]*).*');

D =FOREACH C GENERATE FLATTEN (($0));

STORE D INTO '/pig_conversions/xml_to_csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
