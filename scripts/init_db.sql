
CREATE TABLE `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000000 DEFAULT CHARSET=utf8;

CREATE TABLE `Referers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT 0,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES Users(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000000 DEFAULT CHARSET=utf8;

CREATE TABLE `Referrals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT 0,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES Users(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000000 DEFAULT CHARSET=utf8;

CREATE TABLE `Sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `referer_id` int NOT NULL DEFAULT 0,
  `referral_id` int NOT NULL DEFAULT 0,
  `status` tinyint NOT NULL DEFAULT 1,
  `referral_status` tinyint NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`referer_id`) REFERENCES Referers(`id`),
  FOREIGN KEY (`referral_id`) REFERENCES Referrals(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000000 DEFAULT CHARSET=utf8;

CREATE TABLE `Messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL DEFAULT 0,
  `sender_uid` int NOT NULL DEFAULT 0,
  `receiver_uid` int NOT NULL DEFAULT 0,
  `content` varchar(255) DEFAULT '',
  `status` tinyint NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`session_id`) REFERENCES Sessions(`id`),
  FOREIGN KEY (`sender_uid`) REFERENCES Users(`id`),
  FOREIGN KEY (`receiver_uid`) REFERENCES Users(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000000 DEFAULT CHARSET=utf8;


INSERT INTO `Users` (`id`, `email`, `password`, `firstname`, `lastname`, `status`)
VALUES
	(1, 'a@gmail.com', '123', 'John', 'A', 1),
	(2, 'b@gmail.com', '456', 'Tom', 'B', 1);

INSERT INTO `Referers` (`id`, `user_id`, `status`)
VALUES
	(1, 1, 1);

INSERT INTO `Referrals` (`id`, `user_id`, `status`)
VALUES
	(1, 2, 1);

INSERT INTO `Sessions` (`id`, `referer_id`, `referral_id`, `status`, `referral_status`)
VALUES
	(1, 1, 1, 1, 1);

INSERT INTO `Messages` (`id`, `session_id`, `sender_uid`, `receiver_uid`, `content`, `status`)
VALUES
	(1, 1, 1, 2, 'hello world', 1),
	(2, 1, 2, 1, 'ack', 1);
