-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2023 at 10:56 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vacation`
--
CREATE DATABASE IF NOT EXISTS `vacation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vacation`;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `userId` int(11) NOT NULL,
  `vacationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`userId`, `vacationId`) VALUES
(8, 10),
(8, 4),
(8, 14),
(8, 11),
(7, 16),
(7, 3),
(9, 11),
(9, 14),
(9, 4),
(9, 10),
(6, 3),
(6, 4),
(6, 9),
(6, 14),
(6, 14),
(11, 7),
(11, 12),
(11, 13),
(11, 5),
(11, 8),
(11, 1),
(11, 14),
(12, 9),
(12, 7),
(12, 16),
(12, 5),
(12, 12),
(12, 17),
(12, 8),
(12, 1),
(6, 19),
(6, 6),
(6, 17),
(7, 12),
(7, 17),
(3, 10),
(3, 4),
(16, 11),
(16, 4),
(18, 3),
(18, 9),
(7, 4),
(7, 11);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleId` int(11) NOT NULL,
  `role` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleId`, `role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(200) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `firstName`, `lastName`, `username`, `password`, `roleId`) VALUES
(1, 'Nicole', 'Zabarinsky', 'UniCole', '804251fdad2577a8cc2b1c3d60b7d0cf72e23c0250b0085c10fa8004dddbbb35c88387d9d2e665c4589010c58a12ff202b869c02859d6a80fa5286e9b39a5ab6', 1),
(2, 'bart', 'simpson', 'bart123', '274e2bff61a9b36a7fe11aa1c5dcf7107dc27416d2a7cd1d519f0e749193528699ea5e8f4e7b6cab358119cb119e6cfb91ab0ccd9647c19d3a74246eb3fbf43d', 2),
(3, 'Anakin', 'Skywalker', 'DarthVader', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(4, 'Harry', 'TheChosenOne', 'TheChosenOne', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(5, 'bart1', 'simpson1', 'bartSimpson11', 'beafcc5e8fe758bdc55ce86121de5fa19e7f853dac863a5ee51cdefdc95f393ff0f77cc0d5ff2c4e569f1a752b0bd75b0318d70e105054508534fd0940ff2be7', 2),
(6, 'Lisa', 'Simpson', 'lisa123', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(7, 'Homer', 'Simpson', 'Homer22', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(8, 'lisa', 'simpson', 'lisa11', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(9, 'Maria', 'Vareikis', 'MariaDB', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(10, 'fcghgf', 'dfghf', 'qwerty', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(11, 'marge', 'simpson', 'marge11', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(12, 'bart', 'simpson', 'bart33', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(13, 'masha', 'varei', 'masha', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(14, 'awsgrfth', 'wedrftgh', 'qwerty123', '5409e00b369ae781c0fb1bdddecf39a91a83709fca7d591091bf3499c112c7129a883733597468f01a74404bff4ac4efaa9ef889371f5792d53c772f66313657', 2),
(15, 'anakin', 'skywalker', 'darthVader', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(16, 'ben', 'solo', 'KyloRen', '475594658ee267ed38042cd53243a6e8870a2e3f1f68b78b537cad8cddfd6d7ba924dfd617da21f10268e3d9938b196db8c8dc1a86cc578d999f9ac7b20a7e77', 2),
(17, 'aff', 'aff', 'abcd', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 2),
(18, '11', '11', '1234', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vacations`
--

CREATE TABLE `vacations` (
  `vacationId` int(11) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `imageName` varchar(500) NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vacations`
--

INSERT INTO `vacations` (`vacationId`, `description`, `destination`, `imageName`, `checkIn`, `checkOut`, `price`) VALUES
(1, 'London is one of the most popular cities in the world. It’s home to charming pubs, world-class (and often free) museums, tons of history, some of the best theater in the world, a diverse population, incredible food, and a wild nightlife.', 'London, England', '76d7619b-7e9c-4204-a840-cc79e0d30947.jpg', '2022-11-24', '2022-12-01', 3990),
(3, 'Santorini is the most spectacular island in Greece and one of the geologic treasures of Europe. The five villages of Fira, Oia, Imerovigli, Firostefani, and Akrotiri sit atop the caldera and offer spectacular views into the crater created from a 16th-century BC volcanic eruption. What remains is an incredible sight and a magical setting for island hikes, infinity pools, luxury hotels, clifftop wineries, and dreamy sunset dinners. With a land area of 76 square kilometers, Santorini is a little bigger than New York’s island of Manhattan.', 'Santorini , Greece', 'f6ba460c-e144-42c3-8cbb-a27cc64df50e.jpg', '2023-06-28', '2023-07-05', 3208),
(4, 'Koh Phangan (also spelt Ko Pha-Ngan) is Thailand’s 5th biggest island and one of the most beautiful and wild. Located 70 km from the mainland and just 12 km from Koh Samui, Phangan does not have an airport and relies heavily on ferries from the mainland and Koh Samui to transport visitors.\r\nThe island is renowned for its lush tropical jungle interior, many idyllic, long, white-sand beaches and over 20 nearby dive sites. The main disembarkation points are Thongsala and Haad Rin, where you\'ll find plenty of ATM machines and banks. Koh Phangan’s main claim to fame is its legendary Full Moon Party, Black Moon Party with the Full Moon celebrations attracting between 10,000 and 30,000 revellers during New Year’s Eve.', 'Koh Phangan, Thailand', '633b29a0-1e5b-46f3-8a64-aad7d745ae8b.jpg', '2023-11-15', '2023-12-20', 4990),
(5, 'Dubai is full of contrasts. There\'s the glittering skyline, made up of skyscrapers so tall they defy imagination; the modern collection of stores and eateries, offering up every kind of option a traveler could possibly want; and the luxurious hotels, ready to welcome even the most discerning traveler in style and excess.\r\nToday, Dubai can be fast and slow at the same time—a place to grab an avocado toast and relax on the beach, a place to appreciate a desert conservation reserve, and a place to shop \'til you drop or party the night away all in the same day.', 'Dubai, Arab-Emirates', 'dfbb25af-9bab-418a-8ad9-6f85ec6fa44f.jpg', '2023-01-18', '2023-02-01', 2790),
(6, 'Experience Tanzania safaris with your naked eyes. The sound of chirping birds in the Ngorongoro Crater, or even the first rays of the sun breaking over Mount Kilimanjaro, may wake you up.\r\nTanzania is a classic safari destination and home to some of Africa’s best known parks, including the famous Serengeti, and Africa’s largest game reserve – the Selous.\r\nCombine your safari adventure with a tropical island stay in Zanzibar, just off the Tanzania coast, for the ideal mix of adventure and relaxation.', 'Tanzania , Africa', '9166a0e8-7d5b-4142-b6f2-5fd4a32a5dd3.jpg', '2023-05-22', '2023-06-08', 4289),
(7, 'New York is impossible to “see” in one visit. This city is home to thousands of restaurants, hundreds of museums, attractions, plays, and quirky things to do.\r\nCheck out the views from the top of the Empire State Building, Rockefeller Center, or One World Observatory. Take yourself on a museum crawl, starting at The Metropolitan Museum of Art on the northeastern edge of Central Park.Go to Chinatown for dim sum and to Little Italy for cannoli. Head to a jazz club in Harlem, check out the independent artist galleries that dot Chelsea, shop along Fifth Avenue, and pay a visit to the Statue of Liberty.\r\nYou could spend an entire day in Central Park alone, checking out its zoo, carousel, lakes, and ice rink. A number of gardens and meadows make for excellent people-watching and host impromptu musical performances on nice days. Traveling in the summer? Make sure to check the schedule for Shakespeare in the Park.', 'New york, USA', '14668f0c-a8f9-4285-a147-3cb91b796a55.jpg', '2023-06-21', '2023-08-16', 6750),
(8, 'Venice, known also as the “City of Canals,” “The Floating City,” and “Serenissima,” is arguably one of Italy\'s most picturesque cities. With its winding canals, striking architecture, and beautiful bridges, Venice is a popular destination for travel.', 'Venice, Italy', 'f9cca5c6-13f1-4dd9-a09f-c37e2ff421ea.jpg', '2023-05-22', '2023-05-29', 1839),
(9, 'Kudadoo Maldives Private Island – Luxury All inclusive by Hurawalhi is an exclusive resort consisting of just 15 expansive, over water Ocean Residences with 44 sq yard terrace pools. It is located in the Lhaviyani Atoll and will be the first top-end 5 star deluxe resort in the Maldives to be truly fully inclusive.', 'Kudadoo, Maldives', 'fb1cab7b-3bf9-49d4-b91e-b0c8671240de.jpg', '2023-07-10', '2023-07-24', 8799),
(10, 'Lucerne City is truly called the “Heart of the Country”. Thanks to its location, Lucerne is ranking among the prettiest cities in the world.\r\nJust about all the elements of a perfect tourist town converge in Lucerne (Luzern in German): a splendid waterfront setting against a backdrop of mountains; historic churches, interesting shops, and plenty of greenery; several outstanding annual music festivals and a fine fleet of paddlesteamers.', 'Luzern, Switzerland', '4ced8bbd-9b15-46b6-9bca-601e61f916ab.jpg', '2023-08-23', '2023-09-06', 1820),
(11, 'The Scottish Highlands is really the Scotland of your imagination. With welcoming people, a unique culture, dramatic landscapes, romantic castles and a fascinating history, this is the perfect backdrop for your next adventure.\r\nThere are plenty of things to do in the Highlands. Explore the mysterious Loch Ness, pass through the Cairngorms National Park, marvel at iconic castles on the Isle of Skye, witness dolphins frolicking off the Moray Speyside coast, walk up Britain\'s highest peak, Ben Nevis, in Lochaber, or explore the rugged coastline of Caithness.', 'Highlands, Scotland', '06793489-f927-4e23-9590-18b8d82a79e9.jpg', '2023-09-07', '2023-09-18', 1429),
(12, 'The world’s northernmost capital is waiting for you. The name Reykjavik means “smoky bay” and originates from the country’s numerous hot springs. The city is worth visiting both in winter as well as in summer, and those are actually the only two seasons in Iceland. In winter, you’ll get four hours of daylight and the northern lights, while in summer, you can experience the midnight sun.', 'Reykjavik, Iceland ', '048f55e8-95bc-45ab-8899-ddb8fc6d1fa7.jpg', '2023-03-13', '2023-03-23', 1799),
(13, 'Sydney is a vibrant, multi-cultural city, with an enviable lifestyle centred around its spectacular harbour. The Sydney Opera House and Sydney Harbour Bridge are Australian icons and twin jewels against the backdrop of this bustling metropolis. You can enjoy the stunning views and conquer the icon with a Sydney Harbour Bridge climb. Whether you’re a tourist or a first-time traveller, Sydney Opera House has something for everyone. Pick a tour or watch a live performance, Sydney Opera House’s magnificent beauty never fails to mesmerise.', 'Sydney, Australia ', '88259c32-b6e0-403b-b3bb-b76e3d97759c.jpg', '2023-02-25', '2023-03-04', 5499),
(14, 'Vancouver acts as a gateway to Canada’s great outdoors, be it along the Pacific Coast or up in the Pacific Ranges. Within an hour’s drive out from Vancouver’s high-rise downtown hub, you hit gorgeous beaches and forested mountains.\r\nIt’s often considered one of the most liveable and beautiful cities in the world. Starting at the striking waterfront landmark of Canada Place, you can explore the city\'s beloved outdoor attractions, such as Queen Elizabeth Park,  or head north from the famous Stanley Park and across Lions Gate Bridge to the peak of Grouse Mountain.', 'Vancouver, Canada', 'd7bde080-b264-4f39-852f-ed795f41315c.jpg', '2023-08-23', '2023-09-19', 3089),
(16, 'Eilat is a city based around tourism, with fun activities for everyone. Spend your time sunbathing, diving, hiking nature trails, or hopping the border for an adventure in Jordan or Egypt! Whats more, the city sees less than ten days of rain a year – so you’re practically guaranteed some sunshine regardless of the season.\r\nThere are 51 hotels in Eilat, ranging from youth hostels to luxury. In addition, Eilat has an abundance of fine restaurants, nightclubs, and VAT-free shopping. The sun-splashed city of 60,000 residents is especially popular with tourists from across Europe – and is growing in popularity with international tourists since the addition of its new international airport.', 'Eilat, Israel', '82da78b6-0482-4ffc-b21e-899463a2fb60.jpg', '2023-06-07', '2023-06-14', 1099),
(17, 'Las Vegas is an iconic U.S. town known for over-the-top fun. The Las Vegas Strip is all about neon lights, casinos, lavish hotels, and restaurants helmed by some of the world\'s best chefs. Whether you\'re heading to Las Vegas to celebrate, gamble, take in a Cirque du Soleil show, or catch your favorite musician\'s residency, you\'ll find it in the city where visitors go all out for entertainment.', 'Las Vegas, USA', 'cfe06346-e82b-4c20-8e2c-85ee62dcd2f8.jpg', '2023-05-25', '2023-06-01', 1520),
(19, 'Located in Southeast Asia, Singapore is a city-state and is one of the most prosperous countries in the world. Boasting the busiest port in the world as well as the third most dense population in the world, Singapore is a fascinating region the blends Indian, Malaysian and Chinese culture with modern skyscrapers and subways. With a wonderful tropical climate, vibrant nightlife, fantastic shopping and exotic cuisine, Singapore is a popular holiday destination known as the \'Garden City\'.', 'Singapore ', '780fbb67-bd08-451a-ba25-2a7d7b94fa4d.jpeg', '2023-03-22', '2023-04-02', 2169),
(37, 'Barcelona contains both the authentically historic and the wildly bizarre. From the scenic trails of the colorful Park Güell to the romantic narrow alleys of Barri Gòtic; from the beachside nightclubs to the city\'s dozens of sacred churches and architectural marvels, this city by the sea seems to attract all types: the adventurer, the couple, the partier, the culture lover – and more – with an almost overwhelming variety of things to do. You could stay for a few days, but chances are you\'ll need a whole week to explore.', 'Barcelona, Spain', 'd2d8cb2d-eae4-4098-a89d-8221b0d449d4.jpeg', '2023-05-15', '2023-05-26', 1609),
(38, 'Tokyo is a city of surprises — ancient temples are nestled among modern skyscrapers and you\'re just as likely to see someone wearing a cosplay costume as you are to see someone dressed in a traditional kimono. These contradictions and surprises make Tokyo a city that leaves you curious, fascinated, and wanting more. In a single day you can visit a 7th-century temple, order ramen from a vending machine, and watch a sumo match. There is no shortage of things to do, see, and eat in Tokyo, and while its citizens tend to be respectful and accommodating, they too, like to keep you on your toes. Swing by a maid cafe or a Babymetal concert and you\'ll know what I mean.', 'Tokyo, Japan', '9936e877-23aa-4bbb-94b1-a97c9346e611.jpg', '2023-03-27', '2023-04-10', 2599),
(39, 'Paris is a city unlike any other. It is overflowing with culture, history, and beauty. And while people travel to Paris to see the Louvre, climb the Eiffel Tower, or see Notre-Dame, the real magic is found in the streets.\r\nAs you explore the streets of Paris, you\'ll find yourself walking the hills of Montmartre in search of that perfect crepe spot or meandering through Belleville, a Chinese neighborhood interspersed with hip, young Parisians and elaborate murals. Across the Seine, you might find yourself enjoying an all-too-early verre du vin at a café in Saint-Germain-des-Prés or exploring the winding streets of the Latin Quarter. It doesn\'t take much to find yourself fully immersed in this special city.', 'Paris, France', '2ecf1165-2ad1-477c-af0b-5032f4f32526.jpg', '2023-06-14', '2023-06-21', 1450);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD KEY `userId` (`userId`),
  ADD KEY `vacationId` (`vacationId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleId`),
  ADD KEY `userId` (`roleId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `roleId` (`roleId`);

--
-- Indexes for table `vacations`
--
ALTER TABLE `vacations`
  ADD PRIMARY KEY (`vacationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vacations`
--
ALTER TABLE `vacations`
  MODIFY `vacationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `followers_ibfk_3` FOREIGN KEY (`vacationId`) REFERENCES `vacations` (`vacationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
