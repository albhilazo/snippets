/* ViewHolder */

/**
 * ListView optimization: recycling views.
 * ViewHolder usage.
 * From Google I/O 2009 [1:45-13:00]:   http://www.youtube.com/watch?v=N6YdwzAvwOA
 */
    static class ViewHolder {
        TextView text;
        ImageView icon;
    }
    
    public View getView( int position, View convertView, ViewGroup parent ) {
        ViewHolder holder;
        
        if( convertView == null ) {
            convertView = mInflater.inflate( R.layout.item, null );
            
            holder = new ViewHolder();
            holder.text = (TextView) convertView.findViewById(R.id.text);
            holder.icon = (ImageView) convertView.findViewById(R.id.icon);
            
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }
        
        holder.text.setText(DATA[position]);
        holder.icon.setImageBitmap(position & 1 ==1 ? mIcon1 : mIcon2);
        
        return convertView;
    }