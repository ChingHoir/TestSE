-- Insert default admin user
-- Password: admin123 (BCrypt hashed)
INSERT INTO users (username, password, full_name, email)
VALUES ('admin', '$2a$10$xQYLz2kGDWVQNfkNfQzVw.FhqvXH/4H9qIp8fL3aJUzNq5X9WPxNu', 'Admin User', 'admin@library.com');

-- Insert default member user
-- Password: user123 (BCrypt hashed)
INSERT INTO users (username, password, full_name, email)
VALUES ('user', '$2a$10$xqWYvK1vP8FhL1aMjd4gueJWJCR4qCVLFN1.FO8K3LJvY6qxN.E2W', 'Regular User', 'user@library.com');

-- Assign roles to users
-- Admin gets LIBRARIAN role
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE u.username = 'admin' AND r.name = 'LIBRARIAN';

-- User gets MEMBER role
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE u.username = 'user' AND r.name = 'MEMBER';