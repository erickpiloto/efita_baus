\# efita\_baus



Sistema de baús configuráveis para servidores FiveM QBCore.



Desenvolvido por \*\*ErickFita - QBCore Scripts\*\*.
Versão: 1.0.0


\---



\## Recursos



\* Baús para facções (gangs)

\* Baús para empregos (jobs)

\* Baús VIP vinculados ao CitizenID

\* Baús públicos individuais

\* Controle de acesso por grade mínima e máxima

\* Integração com qb-target

\* Integração com qb-inventory

\* Compatível com QBCore padrão

\* Configuração totalmente via arquivo Lua

\* Sem banco de dados

\* Sem interface NUI

\* Comando `/meucid`



\---



\## Dependências



\* qb-core

\* qb-target

\* qb-inventory

\* oxmysql



\---



\## Instalação



1\. Copie a pasta `efita\_baus` para a pasta `resources` do seu servidor.



2\. Adicione ao seu `server.cfg`:



```cfg

ensure efita\_baus

```



3\. Configure seus baús no arquivo:



```text

config.lua

```



4\. Reinicie o servidor ou execute:



```cfg

restart efita\_baus

```



\---



\## Configuração



\### Baús de Facções



```lua

Config.BausFaccoes = {



&#x20;   \['ballas'] = {



&#x20;       {

&#x20;           id = 'ballas\_geral',

&#x20;           label = 'Baú Geral',



&#x20;           gradeMin = 0,

&#x20;           gradeMax = 4,



&#x20;           slots = 100,

&#x20;           peso = 100000,



&#x20;           coords = vector3(100.0, 100.0, 100.0)

&#x20;       }



&#x20;   }



}

```



\---



\### Baús de Empregos



```lua

Config.BausEmpregos = {



&#x20;   \['police'] = {



&#x20;       {

&#x20;           id = 'police\_armario',

&#x20;           label = 'Armário Policial',



&#x20;           gradeMin = 0,

&#x20;           gradeMax = 4,



&#x20;           slots = 100,

&#x20;           peso = 100000,



&#x20;           coords = vector3(200.0, 200.0, 200.0)

&#x20;       }



&#x20;   }



}

```



\---



\### Baús VIP



```lua

Config.BausVIP = {



&#x20;   {

&#x20;       citizenid = 'ABC12345',



&#x20;       id = 'vip\_abc12345',

&#x20;       label = 'Baú VIP',



&#x20;       slots = 500,

&#x20;       peso = 1000000,



&#x20;       coords = vector3(300.0, 300.0, 300.0)

&#x20;   }



}

```



\---



\### Baús Públicos



Cada jogador acessa seu próprio inventário utilizando o mesmo ponto físico.



```lua

Config.BausPublicos = {



&#x20;   {

&#x20;       id = 'praca\_central',



&#x20;       label = 'Baú Público',



&#x20;       slots = 100,

&#x20;       peso = 100000,



&#x20;       coords = vector3(400.0, 400.0, 400.0)

&#x20;   }



}

```



\---



\## Sistema de Permissões



O acesso é controlado através de:



```lua

gradeMin

gradeMax

```



Exemplos:



```lua

gradeMin = 0

gradeMax = 4

```



Todos os membros podem acessar.



```lua

gradeMin = 2

gradeMax = 4

```



Somente grades 2, 3 e 4.



```lua

gradeMin = 4

gradeMax = 4

```



Somente o chefe.



\---



\## Comando



Exibe o CitizenID do jogador:



```text

/meucid

```



\---



\## Créditos



\*\*ErickFita - QBCore Scripts\*\*



Desenvolvido para servidores FiveM utilizando a framework QBCore.



