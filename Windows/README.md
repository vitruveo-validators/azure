
![image](https://github.com/vitruveo-validators/azure/assets/157662422/d5ddfd24-2b07-4b75-aba9-de7ecd5a4518)




**START HERE - prerequisites**

**STEP 1** First create your Azure account - https://azure.microsoft.com/en-us/free

**STEP 2** Second, pick a Region (green dot) from this interactive site - https://datacenters.microsoft.com/globe/explore

**STEP 3** Third, pick a virtual machine size or use the suggestion in this guide - https://learn.microsoft.com/en-us/azure/virtual-machines/sizes

**STEP 4** Follow this document on a Windows 10 or Windows 11 with all updates installed and as a local Administrator 



**$\color{Red}Review\ each\ step\ carefully\ and\ check\ your\ steps\ vs.\ the\ images.\ Don't\ rush.\$**



**1. Run a command prompt as an Administrator (you need to be a local admin of your machine):**


![image](https://github.com/vitruveo-validators/aws/assets/157662422/b4131d26-9303-4072-a010-54b9ff717d83)



**2. Create a folder and download files:**

Type cd\ and hit **enter**

    cd\

![image](https://github.com/vitruveo-validators/aws/assets/157662422/051ce98d-f33f-45da-a978-724ef1cdcb3b)

Type **md azure** and hit **enter**

    md azure

![image](https://github.com/vitruveo-validators/azure/assets/157662422/43a876df-34f8-4e7a-aad5-2003a6c34d93)

Type **cd azure** and hit **enter**

    cd azure

![image](https://github.com/vitruveo-validators/azure/assets/157662422/a08704d3-ab99-4b02-8e87-8508f74ee4d2)


**3. Download Terraform Code by clicking on the image 'Download ZIP'**

[![image](https://github.com/vitruveo-validators/azure/assets/157662422/0ef2634f-0d7d-4bd6-938e-8bd802a407b5)
](https://github.com/vitruveo-validators/azure/archive/refs/heads/main.zip)


**4. Download Azure CLI by clicking the following image**

[![image](https://github.com/vitruveo-validators/azure/assets/157662422/746c64ed-32a0-48e5-9bf6-c57bf6e8ed8b)
](https://aka.ms/installazurecliwindowsx64)


**5. On your PC, open File Explorer and navigate to your Downloads folder**

![image](https://github.com/vitruveo-validators/aws/assets/157662422/ac780075-11e3-4022-8bbe-fc4c613da768)

  
a) Right click on azure-main.zip and select 'Extract All'


![image](https://github.com/vitruveo-validators/azure/assets/157662422/0cac875b-743c-4ca7-afa5-e65cd9075604)



b) Change the location of the extracted files by typing c:\azure\ and click 'Extract'


    c:\azure\


![image](https://github.com/vitruveo-validators/azure/assets/157662422/fbde6ead-3c88-48c6-a979-432a314b5f47)


c) Install Azure CLI by running the file 'azure-cli-2.57.0-x64.msi' and selecting all defaults


![image](https://github.com/vitruveo-validators/azure/assets/157662422/64a5235e-b66f-4c6c-8ce1-6e6069a1098c)


d) Navigate to the azure-main folder - c:\azure\azure-main - right click on the file 'terraform_1.7.2_windows_386.zip' and select 'Extract All'

![image](https://github.com/vitruveo-validators/azure/assets/157662422/031e197e-94bf-474b-b552-4eb0c6b6a5f2)


e) Type c:\azure\azure-main\ and then select 'Extract' **NOTE** - make sure its the same as this image.

    c:\azure\azure-main\

![image](https://github.com/vitruveo-validators/azure/assets/157662422/68044d55-7a03-4bb4-b319-0ec12efe25ab)


**$\color{Red}Close\ ALL\ Windows\ and\ restart\ the\ Command\ Prompt\ as\ an\ Administrator\ like\ in\ Step\ 1.$**


**6. Authorizing against your Azure account**

a) Change to the Azure-main directory by typing **cd c:\azure\azure-main** and hit enter

    cd c:\azure\azure-main

![image](https://github.com/vitruveo-validators/azure/assets/157662422/56d4ec46-346a-4045-9250-fa628c667fd5)

b) Authorize to your Azure account using email and password by typing **az login** and hitting enter

    az login

![image](https://github.com/vitruveo-validators/azure/assets/157662422/bc68e0df-b0b8-49d6-bb74-4692d0e326ce)

c) A web browser should open for you to enter your email account for Azure and password that was created in STEP 1

![image](https://github.com/vitruveo-validators/azure/assets/157662422/b60f3466-71cf-466a-b75c-0f7ec8fdd4dc)

d) Once successful, you should see this windows and it can be closed

![image](https://github.com/vitruveo-validators/azure/assets/157662422/cf3ff8bf-94c1-4d81-85b1-dbbaf21ad675)

e) Once successful move to step 7.


**7. **VERY IMPORTANT STEP** - Take your time as it needs to be done correctly**


a)  Type **Terraform init** and hit enter - NOTE: This can take a while

    Terraform init

![image](https://github.com/vitruveo-validators/azure/assets/157662422/36ddbe69-0b85-434f-9924-a55330dc2276)

b) Copy and paste the following command

   NOTE: This command should list all the current Azure Regions around the world. Earlier you picked a region, now from this list copy your region in this format i.e. 
   Sweden Central = swedencentral NOT sweden. Brazil South = brazilsouth NOT brazil
    
    az account list-locations --query "sort_by([].{Location:name}, &Location)" -o table

![image](https://github.com/vitruveo-validators/azure/assets/157662422/2574efc1-a04c-4e9e-a54a-b3bf5644cdd8)

c) Type **Terraform plan** hit enter and add your predetermined region and hit enter again

    Terraform plan

![image](https://github.com/vitruveo-validators/azure/assets/157662422/02b8a4c2-f967-4ae6-8ba9-e8a79e5ebcaa)

d) Enter your Azure Virtual machine vm size here. i.e. **Standard_F4s_v2** then hit enter

    Standard_F4s_v2

![image](https://github.com/vitruveo-validators/azure/assets/157662422/93c03700-9414-42d9-85cc-ffc7ec6283c3)

![image](https://github.com/vitruveo-validators/azure/assets/157662422/4283a576-3477-420c-aa0e-e925706decd6)


**NOTE** if you receive and error about a Region not being supported like "canada" pick another region from the list like "canadacentral"

![image](https://github.com/vitruveo-validators/azure/assets/157662422/41c97517-cb79-4178-bf15-a76292f2b98d)



e) Confirm that Plan: 10 to add, 0 to change, 0 to destroy. is displayed

![image](https://github.com/vitruveo-validators/azure/assets/157662422/0c07213b-a8b4-4ccb-ae01-3e8435cb6a2b)

f) Copy **Terraform apply -auto-approve** and hit enter

    Terraform apply -auto-approve

![image](https://github.com/vitruveo-validators/azure/assets/157662422/6f75d613-1bcf-4920-af49-81714aa659c6)


g) Enter your Azure Virtual machine vm size here. i.e. **Standard_F4s_v2** then hit enter

    Standard_F4s_v2

![image](https://github.com/vitruveo-validators/azure/assets/157662422/68f628ba-b819-464c-be6d-01c5ae45274c)


f) Make sure 'Apply complete! Resources: 10 added, 0 changed, 0 destroyed.'


![image](https://github.com/vitruveo-validators/azure/assets/157662422/793256ba-6c4f-4cac-8896-9fd8e2e69107)




**8. Your Validator is deployed to Azure with the following configuration:**
   - Pre configured Network Security Group with all required ports
   - Static Public IP bound to Validator
   - Key Pair to securely SSH into your Validator when needed
   - Azure Ubuntu VM with 4 vCPUs, 8gb RAM and a 256GB SSD
   - validator.pem file downloaded locally

![image](https://github.com/vitruveo-validators/azure/assets/157662422/ea822892-cb0e-46bb-9b08-6469e43b685d)



**Next steps in the process is to connect to your newly deployed Azure instance and install VTRU Validator code**



https://github.com/vitruveo-validators/azure/blob/main/Windows/vtru-setup






