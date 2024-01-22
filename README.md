# Veterinary Practice Database 
## About 
I built this database for a college project. The assignment required students to design and construct a database that can be deployed in a commercial database management system. 

The professor provided us with a scenario where we had to design a database for a veterinary practice.

## Design Rationale
The design of the VPDB is based on my own experience of attending veterinary practices with the family dog. The experience helped me to decide on which entities (or tables) to include in the ERD. A lot of my effort went into developing the correct cardinality between the entities. My design decisions took inspiration mainly from Nalimov (2021) and Nardozzi (n.d.). Additionally, I cite Brumm (2019) on how to create bridge tables.
For the design, I decided that the appointment would be the starting point for the VPDB workflow. The appointment is made for the animal and not the owner, but the owner is the parent of one or many animal entities. Additionally, the appointment joins the animal with a member of staff (vet or veterinary nurse). Next, the appointment forms a relationship with the diagnosis. The diagnosis has a number of relationships as it bridges with the food, medicine and procedure entities, and is the parent to the invoice entity. Finally, the Payment table bridges the invoice with the owner.

My aim was to capture a logical workflow from appointment to payment, and to demonstrate a practical cardinality between the entities. Additionally, I tried to avoid data redundancy by ensuring that there was no repetition of attributes between tables, and that table object retained their own data: for example the cost of the food is contained in the Food table and not the Invoice table.

The design of the Veterinary Practice Database (VPDB) follows best practice as outlined by Connoly and Begg (2015), and Foley (2023a, 2023b). Additionally, the VPDB was influenced by Chegg (n.d), Nalimov (2021), Nardozzi (n.d.) and Pro-Vet Clound (n.d.).


## Development
I developed the ERD in Lucid Chart with guidance from Taylor (2017). I used Lucid Chart’s export feature to generated the code. However, I needed to edit the generated code, mainly to include the correct order of primary and foreign keys and to include NULL enforcement. I also developed practical instances of test data which is contained in the same SQL file as the VPDB.

## Deployment
The VPDB and the test data are both held in one SQL file. You can import the VPDB SQL file into XAMPP and access the data via the console. To my knowledge, there are no other deployment requirements.

## Concluding Comments
I intentionally kept the VPDB design and test data simple. The VPDB follows one logical workflow but future iterations should explore other work flows: a vet visiting multiple farm animals in one visit for example.

## References
Brumm, B. (2019) ‘How to Correctly Define Many-To-Many Relationships in Database Design’, Database Design [Video] available: https://www.youtube.com/watch?v=1eUn6lsZ7c4&ab_channel=DatabaseStar [accessed 03 May 2023].

Chegg, n.d ERD Vet Clinic, available: https://www.chegg.com/homework-help/questions-and- answers/erd-help-please-already-diagram-vet-dog-clinic-add-new-steps-include-directions-picture- al-q56819216 [accessed 03 May 2023].

Connoly, T. Begg, C 2025 Database Systems, 6th ed, Pearson: UK.

Foley, O. 2023a ‘Designing Relational Database Systems’, 51314 Database Design and Development, 02 March, Atlantic Technology University, available: https://vlegalwaymayo.atu.ie/pluginfile.php/870724/mod_resource/content/7/WEEK6ATU.pdf [accessed 03 May 2023].

Foley, O. 2023b ‘Designing Relational Database Systems 2 Normalization’, 51314 Database Design and Development, 09 March, Atlantic Technology University, available: https://vlegalwaymayo.atu.ie/pluginfile.php/870729/mod_resource/content/5/WEEK7ATU.pdf [accessed 03 May 2023].

Nalimov, C. 2021, ‘ER diagram for a hospital management system (Crow’s Foot notation)’ Gleek, 03 Dec, available: https://www.gleek.io/blog/erd-hospital-management [accessed 03 May 2023].

Nardozzi, M. n.d. Vet Clinical Animal Care System, Creately, available: https://creately.com/diagram/example/hs94s1zm1/vet-clinic-animal-care-system-classic [accessed 20 April 2023].

Pro-Vet Clound, n.d. available: https://www.provet.cloud/ [accessed 20 April 2023].

Taylor, S. 2017, ‘Entity Relationship Diagram (ERD) Tutorial - Part 1’, Diagramming in Lucid chart [Video] available: https://www.youtube.com/watch?v=QpdhBUYk7Kk&ab_channel=LucidSoftware [accessed 03 May 2023].
