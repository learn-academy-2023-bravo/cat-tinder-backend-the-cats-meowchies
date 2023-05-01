cats = [
        {
            name:'ChiChi',
            age:10 ,
            enjoys:'building up the man, by breaking him down',
            image:'https://upload.wikimedia.org/wikipedia/commons/4/43/Coq_orpington_fauve.JPG'
        },
        {
            name:'Bulma',
            age:5,
            enjoys:'engineering at CapsuleCorp',
            image:'http://upload.wikimedia.org/wikipedia/commons/4/4f/Rooster_portrait_alt.jpg'
        },
        {
            name:'King Kai',
            age:7,
            enjoys:'https://tse4.mm.bing.net/th?id=OIP.46n0q-VhAUTrlukZEUX9fQHaFj&pid=Api&P=0'
        },
        {
            name:'Vegeta',
            age:12,
            enjoys:'training to become stronger than Goku',
            image:'https://tse2.mm.bing.net/th?id=OIP.jb4ubknYQOHHR349k1fcTAHaF3&pid=Api&P=0'
        },
        {
            name:'Goku',
            age:12,
            enjoys:'gormet meals',
            image:'https://tse1.mm.bing.net/th?id=OIP.ybNQplkD9tiQyUnYAu7tUQHaE8&pid=Api&P=0'
        }
    ]

    cats.each do |value|
        Cat.create value
        puts "creating cat #{value}"
    end