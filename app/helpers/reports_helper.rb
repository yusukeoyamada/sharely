module ReportsHelper
  def choose_new_or_edit_report
    if action_name == 'new' || action_name == 'confirm'
      confirm_reports_path
    elsif action_name == 'edit'
      report_path
    end
  end
end
