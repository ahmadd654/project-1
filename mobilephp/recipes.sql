CREATE TABLE recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    imagePath VARCHAR(255),
    ingredients TEXT
);

INSERT INTO recipes (title, description, image_path, ingredients) 
VALUES 
('Pasta Primavera', 'A delightful mix of vegetables and pasta.', 'assets/images/pasta.jpg', '200g pasta,1 cup cherry tomatoes,1/2 cup bell peppers,1/4 cup olive oil,Salt and pepper to taste'),
('Chocolate Cake', 'Rich and moist chocolate cake.', 'assets/images/chocolate_cake.jpg', '2 cups flour,1/2 cup cocoa powder,1 cup sugar,1/2 cup butter,1 tsp baking soda');
