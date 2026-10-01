# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: macarval <macarval@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/19 16:33:22 by macarval          #+#    #+#              #
#    Updated: 2026/09/30 22:15:20 by macarval         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= rainfall

# Regular colors
RED			= \033[0;31m
GREEN		= \033[0;32m
YELLOW		= \033[0;33m
BLUE		= \033[0;34m
PURPLE		= \033[0;35m
CYAN		= \033[0;36m
WHITE		= \033[0;37m
RESET		= \033[0m

# Bold
BRED		= \033[1;31m
BGREEN		= \033[1;32m
BYELLOW		= \033[1;33m
BBLUE		= \033[1;34m
BPURPLE		= \033[1;35m
BCYAN		= \033[1;36m
BWHITE		= \033[1;37m

git:
			clear
			git add .
			git status
			@echo "$(RED)Enter the level type:"; \
			echo "1. Docs"; \
			echo "2. Mandatory"; \
			echo "3. Bonus"; \
			read type_choice; \
			case $$type_choice in \
						1) type="docs" ;; \
						2) type="level" ;; \
						3) type="bonus" ;; \
						*) echo "Escolha inválida"; exit 1 ;; \
			esac; \
			echo -n "\n"; \
			echo "$(YELLOW)Enter the number:"; \
			read num; \
			echo -n "\n"; \
			echo "$(PURPLE)Choose status:"; \
			echo "1. Init."; \
			echo "2. In Progress..."; \
			echo "3. Done!!"; \
			echo "4. Correction"; \
			echo "5. Bonus"; \
			read status_choice; \
			case $$status_choice in \
						1) status="Init." ;; \
						2) status="In Progress..." ;; \
						3) status="Done!!" ;; \
						4) status="Correction" ;; \
						*) echo "Escolha inválida"; exit 1 ;; \
			esac; \
			echo -n "\n"; \
			echo "$(GREEN)Enter the commit message:"; \
			read msg; \
			echo -n "\n"; \
			echo "$(BLUE)"; \
			git commit -m "[$(NAME)]: $$type$$num - $$status '$$msg'"; \
			git push

.PHONY:		git
