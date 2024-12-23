# Configurar EIP — Console AWS

Para tornar a sub-rede da sua instância EC2 pública através do console da AWS, você precisa associar um Internet Gateway (IGW) à sua VPC e configurar a tabela de rotas da sub-rede para rotear o tráfego de internet. Aqui estão os passos detalhados para realizar isso sem usar a CLI.

## Passo 1: Verificar se sua VPC já tem um Internet Gateway

1. No console da AWS, vá para o serviço **VPC**.
2. No painel à esquerda, clique em **Internet Gateways**.
3. Veja se há um Internet Gateway associado à VPC da sua instância.
   - Se não houver, clique em **Create internet gateway** e dê um nome ao IGW.
   - Após criar, clique em **Actions > Attach to VPC** e selecione a ***VPC*** associada à sua ***instância EC2.***

## Passo 2: Associar a rota ao Internet Gateway

1. Ainda no serviço **VPC**, no painel à esquerda, clique em **Route Tables**.
2. Identifique a tabela de rotas associada à sub-rede onde está sua instância (provavelmente algo como `aws-controltower-PrivateSubnet2A`).
   - Caso não saiba qual tabela de rotas está associada à sub-rede, vá até **Subnets** no painel à esquerda, localize sua sub-rede e veja o ID da tabela de rotas associada.
3. Selecione a tabela de rotas da sub-rede, clique em **Routes** e depois em **Edit routes**.
4. Adicione uma nova rota:
   - **Destination**: `0.0.0.0/0` (para indicar todo o tráfego de saída).
   - **Target**: Selecione o Internet Gateway que você associou anteriormente.
5. Clique em **Save routes**.

## Passo 3: Verificar se a instância tem um IP público

1. Vá para o serviço **EC2** e localize sua instância.
2. Verifique se a instância tem um IP público. Caso não tenha, você precisará associar um Elastic IP:
   - No painel à esquerda do **EC2**, vá até **Elastic IPs**.
   - Clique em **Allocate Elastic IP address** e em seguida associe o endereço à sua instância.

## Passo 4: Verificar as Configurações de Segurança

1. Certifique-se de que o **Security Group** da instância permite tráfego de entrada (inbound) pela porta 22 (SSH) ou outras portas necessárias.
2. Vá para o painel de **Security Groups** e edite as regras, se necessário.
   - Adicione uma regra para permitir tráfego de entrada **inbound** HTTP (porta 80) e HTTPS (porta 443).
   - Certifique-se de que o SSH (porta 22) está habilitado no **inbound** para que você possa acessar a instância.
   - Para acesso a rede externa, certifique de que outbound rules tenha tráfego (all trafic).

## Conclusão

Após esses passos, sua sub-rede se tornará uma sub-rede pública e sua instância EC2 estará acessível via internet. Isso permitirá o uso de ferramentas como **EC2 Instance Connect** para conectar-se remotamente à instância.

## Fontes

- ***[AWS Documentation on VPCs and Internet Gateways](https://aws.amazon.com/documentation/vpc/)***
- ***[AWS EC2 Instance Connect Documentation](https://docs.aws.amazon.com/ec2-instance-connect/)***
