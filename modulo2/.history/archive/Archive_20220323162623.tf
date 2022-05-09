 terraform {
   required_providers{
       archive = {

              source = "hashicorp/archive"
       }
   }
 }

 data "archive_file" "arquivozip"{
     type = "zip"
     source_file = "data_backup/data.txt"
     output_path = "backup.zip"
 }

 output "arquivozip" {
     value = "gerando arquivo com sucesso"
 }
