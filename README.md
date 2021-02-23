# Brasileirão 2020
Projeto para o desafio da Globo para área de Plataformas 

## 📦 A proposta
Nesse projeto o foco foi utilizar ViewCode para componentizar o máximo possível. 
Com isso também foi possível adicionar uma estrutura de MVVM, pois é sempre muito complicado usar Xibs e Storyboards e acaba sendo complicado de executar testes unitários.
Nessa estrutura de MVVM foi utilizado conceitos do SOLID como por exemplo a Inversão de Dependência, algo não muito comum em Swift. A idéia, por mais complexo
que possa parecer é tentar deixar da maneira mais genérica possível, para que o app se torne escalável.
Foi utilizado algumas bibliotecas para agilizar, facilitar e personalizar o app

## 🛠️ Construído com

* [Alamofire](https://github.com/Alamofire/Alamofire) - Biblioteca utilizada para fazer as requisições com o servidor web, optei por ela pela facilidade e já ter um conhecimento sobre o uso
* [Swinject](https://github.com/Swinject/Swinject) - Gerente de Dependência
* [Snapkit](https://github.com/SnapKit/SnapKit) - Utilizado para facilitar a criação de constraint, é a primeira vez que uso algo inteiramente usando viewcode e senti uma grande diferença
* [Lottie](https://airbnb.io/lottie/#/) - Nunca tinha usado o Lottie, usei como perfumaria e tentar entender, animações sempre foi algo que me interessou
* [Hero](https://github.com/HeroTransitions/Hero) - Hero talvez tenha sido uma escolha ruim, é algo que já está meio depreciado há algum tempo, porém queria uma transição diferente, e não estava com tanto tempo quando optei por inseri-lo no projeto 
* [SDWebImage](https://github.com/SDWebImage/SDWebImage) - Quando eu comecei o projeto eu primeiro montei a estrutura no apiary, coloquei os 20 clubes da série A de 2020, quando vi os clubes da proposta e os que eu já tinha colcoado eram diferentes com isso optei por pegar as imagens no site da globo
contudo eram svgs e nunca havia trabalhado com svgs. Acabei utilizando para me auxiliar, porém algumas imagens ficaram ruins :(
* [SkeletonView](https://github.com/Juanpe/SkeletonView)

## 📚 Referências

* [Unit Testing Model View Controller on iOS with Swift](https://medium.com/@ali.aga_2866/unit-testing-model-view-controller-on-ios-with-swift-c010c132292d)
* [SOLID Design Principle using Swift](https://medium.com/ios-expert-series-or-interview-series/solid-design-principle-using-swift-34bb1731cfb3)
* [Escrevendo View Code mais limpo usando loadView()](https://movile.blog/escrevendo-view-code-mais-limpo-usando-loadview/)





