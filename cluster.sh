#!/bin/bash
# Set the output file path CSV
output_file="service_inventory.csv"
# Write CSV header according to the directions, which is Namespace, Name, Age, Type,
Cluster-IP, External-IP, Ports, Endpoints. After that put it in the file CSV
echo "NAMESPACE,NAME,AGE,TYPE,CLUSTER-IP,EXTERNAL-IP,PORT(S),Endpoints"
> "$output_file"
# If want to get namespaces in its kubernetes cluster so we can get list of namespaces
use this command “kubectl get namespace” with metadata namespace
Namespace_List=$(kubectl get namespaces -o jsonpath='{range
.items[*]}{.metadata.name}{"\n"}{end}')
# After get list namespace loop through each namespace because its can get all list name
in namespace. command “kubectl get services -n “ its mean can get list service
information within the namespace
for Namespace in $Namespace_List; do
Service_List=$(kubectl get services -n "$Namespace" -o jsonpath='{range
.items[*]}{.metadata.name}{"\n"}{end}')
# After that want to get all service information and loop through each service
for Service in $Service_List; do
# Get service details
Service_Details=$(kubectl get service "$Service" -n "$Namespace" -o
jsonpath='{.metadata.namespace},{.metadata.name},{.metadata.creationTimestamp},{.spe
c.type},{.spec.clusterIP},{.status.loadBalancer.ingress[*].ip},{range
.spec.ports[*]}{.port}/{.protocol},{end},:{.targetPort}/{.protocol}')
# Before Age use format timestamp so change age in days and then calculate age in
days
Creation_Timestamp=$(echo "$Service_Details" | cut -d',' -f3)
Current_Timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
Age=$(($(date -d "$Current_Timestamp" +%s) - $(date -d "$Creation_Timestamp"
+%s)))
Age_Days=$((Age / 86400)) # Convert age to days
# this variable stores the calculation results Age in the days"
Formatted_Age="${Age_Days} Days"
# After that change variabel result Service_Details in section age and then print all the
result service_detail include change result age last append service details to the CSV file
echo "$Service_Details" | awk -F',' -v OFS=',' -v AGE="$Formatted_Age" '{print $1, $2,
AGE, $4, $5, $6, $7, $8}' >> "$output_file"
done
done
echo "Service inventory has been saved to $output_file"
