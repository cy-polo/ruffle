mod about_dialog;
mod bookmarks_dialog;
mod open_dialog;
mod open_url_dialog;
mod preferences_dialog;
mod volume_controls;

use crate::custom_event::RuffleEvent;
use crate::player::LaunchOptions;
use crate::preferences::GlobalPreferences;
use bookmarks_dialog::{BookmarkAddDialog, BookmarksDialog};
use open_dialog::OpenDialog;
use open_url_dialog::OpenUrlDialog;
use preferences_dialog::PreferencesDialog;
use ruffle_core::Player;
use std::sync::Weak;
use unic_langid::LanguageIdentifier;
use url::Url;
use volume_controls::VolumeControls;
use winit::event_loop::EventLoopProxy;

use super::FilePicker;

pub struct Dialogs {
    event_loop: EventLoopProxy<RuffleEvent>,

    picker: FilePicker,
    preferences_dialog: Option<PreferencesDialog>,
    bookmarks_dialog: Option<BookmarksDialog>,
    bookmark_add_dialog: Option<BookmarkAddDialog>,
    open_url_dialog: Option<OpenUrlDialog>,

    open_dialog: OpenDialog,
    is_open_dialog_visible: bool,

    pub volume_controls: VolumeControls,
    is_volume_visible: bool,

    is_about_visible: bool,

    preferences: GlobalPreferences,
}

impl Dialogs {
    pub fn new(
        preferences: GlobalPreferences,
        player_options: LaunchOptions,
        default_path: Option<Url>,
        window: Weak<winit::window::Window>,
        event_loop: EventLoopProxy<RuffleEvent>,
    ) -> Self {
        let picker = FilePicker::new(window);
        Self {
            preferences_dialog: None,
            bookmarks_dialog: None,
            bookmark_add_dialog: None,
            open_url_dialog: None,

            open_dialog: OpenDialog::new(
                player_options,
                default_path,
                picker.clone(),
                event_loop.clone(),
            ),
            is_open_dialog_visible: false,

            volume_controls: VolumeControls::new(&preferences),
            is_volume_visible: false,

            is_about_visible: false,

            event_loop,
            picker,
            preferences,
        }
    }

    pub fn file_picker(&self) -> FilePicker {
        self.picker.clone()
    }

    pub fn recreate_open_dialog(
        &mut self,
        opt: LaunchOptions,
        url: Option<Url>,
        event_loop: EventLoopProxy<RuffleEvent>,
    ) {
        self.is_open_dialog_visible = false;
        self.open_dialog = OpenDialog::new(opt, url, self.picker.clone(), event_loop);
    }

    pub fn open_file_advanced(&mut self) {
        self.is_open_dialog_visible = true;
    }

    pub fn open_preferences(&mut self) {
        self.preferences_dialog = Some(PreferencesDialog::new(self.preferences.clone()));
    }

    pub fn open_bookmarks(&mut self) {
        self.bookmarks_dialog = Some(BookmarksDialog::new(
            self.preferences.clone(),
            self.picker.clone(),
            self.event_loop.clone(),
        ));
    }

    pub fn open_add_bookmark(&mut self, initial_url: Option<url::Url>) {
        self.bookmark_add_dialog = Some(BookmarkAddDialog::new(
            self.preferences.clone(),
            initial_url,
            self.picker.clone(),
        ))
    }

    pub fn open_volume_controls(&mut self) {
        self.is_volume_visible = true;
    }

    pub fn open_about_screen(&mut self) {
        self.is_about_visible = true;
    }

    pub fn open_open_url(&mut self, url: Url) {
        self.open_url_dialog = Some(OpenUrlDialog::new(url));
    }

    pub fn show(
        &mut self,
        locale: &LanguageIdentifier,
        egui_ctx: &egui::Context,
        player: Option<&mut Player>,
    ) {
        self.open_dialog(locale, egui_ctx);
        self.preferences_dialog(locale, egui_ctx);
        self.bookmarks_dialog(locale, egui_ctx);
        self.bookmark_add_dialog(locale, egui_ctx);
        self.volume_controls(locale, egui_ctx, player);
        self.about_dialog(locale, egui_ctx);
        self.open_url_dialog(locale, egui_ctx);
    }

    fn open_dialog(&mut self, locale: &LanguageIdentifier, egui_ctx: &egui::Context) {
        if self.is_open_dialog_visible {
            let keep_open = self.open_dialog.show(locale, egui_ctx);
            self.is_open_dialog_visible = keep_open;
        }
    }

    fn preferences_dialog(&mut self, locale: &LanguageIdentifier, egui_ctx: &egui::Context) {
        let keep_open = if let Some(dialog) = &mut self.preferences_dialog {
            dialog.show(locale, egui_ctx)
        } else {
            true
        };
        if !keep_open {
            self.preferences_dialog = None;
        }
    }

    fn bookmarks_dialog(&mut self, locale: &LanguageIdentifier, egui_ctx: &egui::Context) {
        let keep_open = if let Some(dialog) = &mut self.bookmarks_dialog {
            dialog.show(locale, egui_ctx)
        } else {
            true
        };
        if !keep_open {
            self.bookmarks_dialog = None;
        }
    }

    fn bookmark_add_dialog(&mut self, locale: &LanguageIdentifier, egui_ctx: &egui::Context) {
        let keep_open = if let Some(dialog) = &mut self.bookmark_add_dialog {
            dialog.show(locale, egui_ctx)
        } else {
            true
        };
        if !keep_open {
            self.bookmark_add_dialog = None;
        }
    }

    fn volume_controls(
        &mut self,
        locale: &LanguageIdentifier,
        egui_ctx: &egui::Context,
        player: Option<&mut Player>,
    ) {
        if self.is_volume_visible {
            let keep_open = self
                .volume_controls
                .show(locale, egui_ctx, player, &self.preferences);
            self.is_volume_visible = keep_open;
        }
    }

    fn about_dialog(&mut self, locale: &LanguageIdentifier, egui_ctx: &egui::Context) {
        if self.is_about_visible {
            let keep_open = about_dialog::show_about_dialog(locale, egui_ctx);
            self.is_about_visible = keep_open;
        }
    }

    fn open_url_dialog(&mut self, locale: &LanguageIdentifier, egui_ctx: &egui::Context) {
        let keep_open = if let Some(dialog) = &mut self.open_url_dialog {
            dialog.show(locale, egui_ctx)
        } else {
            true
        };
        if !keep_open {
            self.open_url_dialog = None;
        }
    }
}
