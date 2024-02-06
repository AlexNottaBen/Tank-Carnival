# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends KinematicBody

func _on_LifeTimeTimer_timeout():
	queue_free()

func _on_VisibilityNotifier_screen_exited():
	queue_free()
