# arch-install



                             _             _          ___           _        _ _ 
                            / \   _ __ ___| |__      |_ _|_ __  ___| |_ __ _| | |
                           / _ \ | '__/ __| '_ \      | || '_ \/ __| __/ _` | | |
                          / ___ \| | | (__| | | |     | || | | \__ \ || (_| | | |
                         /_/   \_\_|  \___|_| |_|    |___|_| |_|___/\__\__,_|_|_|



# Pós instalação 

Para obter um ambiente agradável utilizando NVIDIA e Intel, siga os passos a seguir.

De início você deve ter instalado os seguintes pacotes: `nvidia-open`,`nvidia-utils`,`nvidia-settings`.
Você pode instalar esses pacote copiando e colando no terminal o comando:
```bash
sudo pacman -S nvidia-open nvidia-utils nvidia-settings
```  
Certifique-se também de instalar os drivers para o chip gráfico da Intel.
```bash
sudo pacman -S mesa vulkan-intel
``` 
Há também o driver `xf86-video-intel`, mas segundo uma nota na página da Intel Graphics na [Arch Wiki](https://wiki.archlinux.org/title/intel_graphics#Installation) não é recomendado a instalação apartir da 4ª geração de hardwares da Intel. 
Para informações mais detalhadas da instalação desses drivers, tanto da Intel quanto NVIDIA, recomendo seguir os tópicos na Arch Wiki.

[Intel: Arch Wiki](https://wiki.archlinux.org/title/intel_graphics)<br>
[NVIDIA: Arch Wiki](https://wiki.archlinux.org/title/NVIDIA)

# NVIDIA Optimus

NVidia Optimus é uma tecnologia para GPU criada pela Nvidia que permite o usuário alternar e utilizar ambos adaptadores gráficos através do sistema. 
Há alguns métodos para utilizar essa tecnologia e nesse documento será utilizado o [`optimus-manager`](https://github.com/Askannz/optimus-manager).

Utilize o comando a seguir para efetuar o download e a instalação do pacote.
```bash
git clone https://aur.archlinux.org/optimus-manager.git
cd optimus-manager
makepkg -si
```
Você também pode instalar o `optimus-manager` através de um Helper da AUR como o [Yay](https://github.com/Jguer/yay). 

## Utilização
`optimus-manager --switch nvidia` para a utilizar o driver da nvidia.

`optimus-manager --switch integrated` para a utilizar o driver integrado (intel/AMD).

`optimus-manager --switch hybrid` Para utilizar o modo híbrido que utiliza o gráfico integrado mas que utilzara a GPU da Nvidia em caso de demanda que é similar a forma que o Optimus funciona no Windows.

Para mais informações e configurações avançadas, recomendo utilizar a repositório oficial da ferramenta.
https://github.com/Askannz/optimus-manager

### Interface gráfica
O [`optimus-manager-qt`](https://github.com/Shatur95/optimus-manager-qt) fornece uma versão mais amigável com interface gráfica que facilita atroca entre as GPU's.
