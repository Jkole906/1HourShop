DROP TABLE products;
DROP TABLE categories;

CREATE TABLE categories
(
	id		serial,
	name	varchar(100)	not null,

	constraint pk_categories primary key (id)
);

CREATE TABLE products
(
	id			serial,
	name		varchar(255)	not null,
	price		decimal(10,2)		not null,
	description	text		not null,
	category_id	int,
	image		varchar(255)	not null,

	constraint pk_products primary key (id),
	constraint fk_products_categories foreign key (category_id) references categories(id)
);

insert into categories (name) VALUES ('Star Wars');
insert into categories (name) VALUES ('Marvel');
insert into categories (name) VALUES ('DC');



insert into products (name, price, description, category_id, image) values ('Marvel Legends Vintage Spider-Man', '24.99', 'The amazing Spider-Man drops in on criminals with his crook-catching spider-webs! Imagine the web-slinger swinging through the pages of Marvel comics with this 6-inch scale Spider-Man vintage figure, including a pizza slice accessory', 2, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/8f669bfd-9814-4bf7-91db-f6c8e5c0d55f.jpg');
insert into products (name, price, description, category_id, image) values ('Avengers: Infinity War MMS473D23 Iron Man Mark L 1/6 Scale', '406.99', 'A new threat emerged from the cosmos and it became too heavy for any hero to handle! The Avengers must join forces to protect the world and to stop the ruthless warlord and his formidable allies from destroying the universe! Together with other significant superheroes, the latest Iron Man with advance technology that Tony Stark has created will fight against their ultimate villain Thanos! ', 2, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/bde3e08f-e1f4-403d-abc8-24d0a5eb3feb.jpg');
insert into products (name, price, description, category_id, image) values ('Marvel Premium Format Captain America', '569.99', 'Sideshow presents the Captain America Premium Format figure. The Captain America Premium Format Figure measures 21 inches tall on top of a SHIELD Helicarrier platform with a discarded Ultron Sentry arm on the base. His iconic shield has battle-worn details signaling its use in the fight.', 2, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/5b5eb307-62fc-44e5-bae0-51e7c8e214d9.jpg');
insert into products (name, price, description, category_id, image) values ('Marvel Number 00 1/4 Scale Deadpool', '104.99', 'Another addition to the Neca line of quarter scale action figures is Marvels Merc with the Mouth, Deadpool! Possibly the most skilled mercenary in the world... and definitely the most annoying.', 2, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/51b6e81e-84d6-4f55-b65b-c05173a63e94.jpg');
insert into products (name, price, description, category_id, image) values ('Star Wars: Return of the Jedi 1/4 Scale Boba Fett', '432.99', 'The name “Boba Fett” is no stranger to all Star Wars fans. With his customized Mandalorian armor, deadly weaponry, and silent demeanor, Boba Fett was one of the most feared bounty hunters in the galaxy. Following the introduction of Hot Toys’ Star Wars 1/6th scale collectible figures, today Hot Toys is very excited to officially reveal Boba Fett as the first collectible figure of Hot Toys’ Star Wars 1/4th scale collectible series!', 1, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/8c66455e-a4d8-46cc-a2f4-44030a60cbe3.jpg');
insert into products (name, price, description, category_id, image) values ('Star Wars: The Empire Strikes Back 1/6th Scale Yoda', '199.99', 'Jedi Master Yoda was the wisest and most powerful of all Jedi. For over 800 years, Yoda instructed young Jedi and instilled in them a profound sense of discipline, strength, and unity. During the dark times when Galactic Empire ruled the galaxy, Luke Skywalker went to Dagobah in search of Yoda for training to become a Jedi which led to the path that will restore balance to the galaxy!', 1, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/b9caa20d-fba3-46ea-9499-359f27d938ea.jpg');
insert into products (name, price, description, category_id, image) values ('Star Wars: The Force Awakens 1/6th Scale Luke Skywalker', '229.99', 'In the aftermath of the fall of the Empire, Luke Skywalker, the last surviving Jedi, has put himself in exile after his attempt to train a new generation of Jedi went horribly awry. As a new threat to the galaxy known as the First Order emerges, Leia, Han, Chewie, and a group of Resistance heroes risk their lives trying to locate Lukes whereabouts–with the hope of bringing him back into the fold in their desperate struggle to restore peace and justice to the galaxy.', 1, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/51d0b34d-4e91-4a55-82e0-f786a7382087.jpg');
insert into products (name, price, description, category_id, image) values ('Star Wars: The Force Awakens 1/6th Scale Kylo Ren', '199.99', 'The newest installment of the Star Wars saga – Star Wars: The Force Awakens is coming theatres worldwide this December! Star Wars fans around the world just can’t wait for December to come any sooner! But before the movie’s release, a wide range of merchandise based on this upcoming film is starting to hit the stores in September to let Star Wars enthusiasts to get ready for the film!', 1, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/0a3d9921-7c58-4e24-8575-29b6a2b16ae3.jpg');
insert into products (name, price, description, category_id, image) values ('Justice League S.H.Figuarts Batman', '59.99', 'From the 2017 Justice League movie, Batman joins the S.H.Figuarts line. Standing just about 6 inches tall and featuring an all new costume, this Justice League Batman action figure is highly articulated and will be armed with his grapple gun and batarang. In addition Batman will include several interchangeable hands and a cloth cape with wires for posing.', 3, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/cb090c8a-4bd5-4369-ace1-7ec0bddbe5de.jpg');
insert into products (name, price, description, category_id, image) values ('Justice League S.H.Figuarts The Flash', '59.99', 'Next in the dynamic S.H.Figuarts Justice League line-up is the man who came from DC TV drama series The Flash. He is known for his SUPERHUMAN SPEED and incredible performance shown in the  movie Justice League. This is the first time the character has been created in the S.H.Figuarts line! Included with the SH Figuarts The Flash figure are additional 4 hands.', 3, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/12c6bfe4-c8ef-451b-a54f-038fa3ceed33.jpg');
insert into products (name, price, description, category_id, image) values ('Justice League S.H.Figuarts Wonder Woman', '59.99', 'Power, grace, wisdom, wonder! The Amazon princess and legendary superhero Wonder Woman represents one of Americas most popular heroes. Now a figure of her as she appeared in the 2017 film Justice League joins the S.H.Figuarts series! Utilizes digital coloring to perfectly capture the Wonder Woman as portrayed by Gal Gadot, includes an optional pair of hands, an optional head, and a set of weapons (sword, shield, lasso of truth).', 3, 'https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/7acb72b7-9d7a-4822-8d4b-42dbec1f3d0d.jpg');
