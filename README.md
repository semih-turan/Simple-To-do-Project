# Simple-To-do-Project
![logo](readmeAssets/banner.png "Banner Logo")

# Simple To-Do

Simple To-Do, Motoko dilini kullanarak geliştirilmiş bir yapılacaklar kontrol listesi uygulamasıdır.

## Project Description

Bu proje, yapılacaklar kontrol listesi oluşturmayı, öğeleri tamamlamayı ve kaldırmayı sağlayan temel bir akıllı sözleşme içerir. Ayrıca, bir WebAssembly Canister aracılığıyla dağıtılan bir servis sağlar.

## Smart Contract Address

Smart contract address: [Address]

## Installation Prerequisites

Proje yerel cihazınızda çalıştırmak için aşağıdaki gereksinimlere ihtiyaç duyulur:

- IC SDK'nın kurulması
- Terminal erişimi

## Installation

1. Proje dosyalarını içeren klasöre gidin:
    `cd examples/motoko/simple-to-do`


2. Yerel bir örneğini başlatın:
`dfx start --background`


3. Canister'ı deploy edin:
`dfx deploy`


## Usage

Yapılacaklar kontrol listesine öğeler eklemek için:

`dfx canister call simple_to_do addTodo '("Create a project")'
dfx canister call simple_to_do addTodo '("Build the project")'
dfx canister call simple_to_do addTodo '("Deploy the project")'`


Yapılacaklar kontrol listesini görüntülemek için:

`dfx canister call simple_to_do showTodos`


Yapılacakları tamamlamak için:

`dfx canister call simple_to_do completeTodo '(1)'`


Yeniden kontrol listesini görüntülemek için:
`dfx canister call simple_to_do showTodos`


## Contributing

Pull requestleriniz her zaman beklenmektedir.

## License

[MIT](link)


