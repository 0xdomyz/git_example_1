CREATE MULTISET TABLE demo_exposure (
    cut_id INT,
    category VARCHAR(1),
    exposure INT
);
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (1, 'A', 100);
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (2, 'A', 200);
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (3, 'B', 300);
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (4, 'B', 400);
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (5, 'A', 500);
