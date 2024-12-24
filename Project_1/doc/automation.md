<h1 style="font-size:42px">Automação Para Instâncias EC2</h1>

# 2 Possibilidades: Ao criar a Instância vs Conectado à Instância

## Ao criar a Instância
1. Você deve repetir as configurações já selecionadas na [Documentação do Nginx Server](./nginx-server.md)
2. Ir até Advanced Details
3. Dentro de Advanced Details, buscar pela opção User data - *optional*
4. Colar dentro o conteúdo de [ec2_user-data.txt](../scripts/ec2_user-data.txt)
5. Iniciar Instância (Launch Instance)
6. Lembre-se de que todas as outras configurações de VPC, IP e etc devem estar configuradas corretamente.

<br>

---

## Conectado à Instância
Uma vez conectado via ssh execute os seguintes comandos no terminal: (gerenciador de pacotes yum para Amazon linux, mas pode variar dependendo da versão do Linux)
```
sudo yum install git -y
```

```
cd /home/ec2-user
```

```
sudo git clone https://github.com/gabrielng-rj99/PB-CompassUOL-GabrielGomesDev
```

```
bash /home/ec2-user/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/start_instance.sh
```