awk '{
    for(i=1;i<=NF;i++){
        if(fields[i] == ""){
            fields[i] = $i
        }else{
            fields[i] = fields[i]" "$i
        }
    }
}
END{
    for(i=1;i<=NF;i++){
        print fields[i]
    }
}' file.txt