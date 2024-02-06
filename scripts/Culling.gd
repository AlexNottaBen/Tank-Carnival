# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends Spatial

func _on_VisibilityNotifier_screen_entered():
	if settings.culling_enabled:
		$"../../".show()


func _on_VisibilityNotifier_screen_exited():
	if settings.culling_enabled:
		$"../../".hide()
